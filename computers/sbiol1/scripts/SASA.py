import __main__
__main__.pymol_argv = ['pymol','-qc']
import pymol
from pymol import cmd, stored
pymol.finish_launching()

cmd.set('dot_solvent', 1)
cmd.set('dot_density', 3)

cmd.load('file.pdb')  # use the name of your pdb file
stored.residues = []
cmd.iterate('name ca', 'stored.residues.append(resi)')

sasa_per_residue = []
for i in stored.residues:
    sasa_per_residue.append(cmd.get_area('resi %s' % i))

print sum(sasa_per_residue)
print cmd.get_area('all')  # just to check that the sum of sasa per residue equals the total area